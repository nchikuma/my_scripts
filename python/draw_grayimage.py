import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.image as mpimg
import seaborn as sns



def main():
    train = pd.read_csv("./train_10.csv",header=0,index_col=0)
    print("Train DataFrame Shape = ",train.shape)
    
    for index, row in train.iterrows():
        print("index=",index)
        img_array = np.reshape(np.array(row,dtype=np.uint8),(28,28))
        plt.imshow(img_array, cmap='gray', vmin=0, vmax=255, interpolation='none')
        plt.show()
        while True:
            inp=input("Press 'n' to move next, 'q' to quit>")
            if   inp=='n':
                break
            elif inp=='q':
                return
    
    
if __name__ == '__main__':
    main()
